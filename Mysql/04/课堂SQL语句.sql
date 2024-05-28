-- 1.创建user表
CREATE TABLE IF NOT EXISTS `user`(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(30) NOT NULL UNIQUE,
	password VARCHAR(50) NOT NULL,
	createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO `user` (name, password) VALUES (?, ?);
INSERT INTO `user` (id, name, password) VALUES (2, 'lilei', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `user` (id, name, password) VALUES (3, 'hmm', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `user` (id, name, password) VALUES (4, 'luly', 'e10adc3949ba59abbe56e057f20f883e');
SELECT * FROM `user` WHERE name = ?;

-- 2.创建moment(动态)表
CREATE TABLE IF NOT EXISTS `moment`(
	id INT PRIMARY KEY AUTO_INCREMENT,
	content VARCHAR(1000) NOT NULL,
	user_id INT NOT NULL,
	createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY(user_id) REFERENCES user(id)
);

INSERT INTO moment (content, user_id) VALUES (?, ?);

INSERT INTO moment (content, user_id) VALUES ('纵然再苦守数百年 我的心意 始终如一', 1);
INSERT INTO moment (content, user_id) VALUES ('曾几何时，他也好，她也好，都是这家伙的被害者。所以我才憎恶着。这个强求着所谓“大家”的世界。必须建立在牺牲某人之上才能成立的低劣的和平。以温柔和正义粉饰，明明是恶毒之物却登大雅之堂，随着时间的流逝越发凶恶，除欺瞒外别无其二的空虚的概念。过去和世界都是无法改变的。发生过的事情和所谓的“大家”都是无法改变的。但是，并不是说自己只能隶属于他们', 1);
INSERT INTO moment (content, user_id) VALUES ('不要告诉我你不需要保护，不要告诉我你不寂寞，知微，我只希望你，在走过黑夜的那个时辰，不要倔强的选择一个人。', 3);
INSERT INTO moment (content, user_id) VALUES ('If you shed tears when you miss the sun, you also miss the stars.如果你因失去了太阳而流泪，那么你也将失去群星了。', 1);
INSERT INTO moment (content, user_id) VALUES ('在世间万物中我都发现了你，渺小时，你是阳光下一粒种子，伟大时，你隐身在高山海洋里。', 2);
INSERT INTO moment (content, user_id) VALUES ('某一天，突然发现，许多结果都与路径无关。', 4);
INSERT INTO moment (content, user_id) VALUES ('限定目的，能使人生变得简洁。', 2);
INSERT INTO moment (content, user_id) VALUES ('翅膀长在你的肩上，太在乎别人对于飞行姿势的批评，所以你飞不起来', 4);
INSERT INTO moment (content, user_id) VALUES ('一个人至少拥有一个梦想，有一个理由去坚强。心若没有栖息的地方，到哪里都是在流浪。', 2);
INSERT INTO moment (content, user_id) VALUES ('不乱于心，不困于情。不畏将来，不念过往。如此，安好。', 3);
INSERT INTO moment (content, user_id) VALUES ('如果你给我的，和你给别人的是一样的，那我就不要了。', 3);
INSERT INTO moment (content, user_id) VALUES ('故事的开头总是这样，适逢其会，猝不及防。故事的结局总是这样，花开两朵，天各一方。', 2);
INSERT INTO moment (content, user_id) VALUES ('你不愿意种花，你说，我不愿看见它一点点凋落。是的，为了避免结束，你避免了一切开始。', 2);
INSERT INTO moment (content, user_id) VALUES ('你如果认识从前的我，也许你会原谅现在的我。', 4);
INSERT INTO moment (content, user_id) VALUES ('每一个不曾起舞的日子，都是对生命的辜负。', 2);
INSERT INTO moment (content, user_id) VALUES ('向来缘浅，奈何情深。', 2);
INSERT INTO moment (content, user_id) VALUES ('心之所向 素履以往 生如逆旅 一苇以航', 3);
INSERT INTO moment (content, user_id) VALUES ('生如夏花之绚烂，死如秋叶之静美。', 3);
INSERT INTO moment (content, user_id) VALUES ('答案很长，我准备用一生的时间来回答，你准备要听了吗？', 4);
INSERT INTO moment (content, user_id) VALUES ('因为爱过，所以慈悲；因为懂得，所以宽容。', 4);
INSERT INTO moment (content, user_id) VALUES ('我们听过无数的道理，却仍旧过不好这一生。', 1);
INSERT INTO moment (content, user_id) VALUES ('我来不及认真地年轻，待明白过来时，只能选择认真地老去。', 2);


SELECT * FROM moment LIMIT ? OFFSET ?;

SELECT 
	m.id id, m.content content, m.createAt createTime, m.updateAt updateTime,
	JSON_OBJECT('id', u.id, 'name', u.name, 'createTime', u.createAt, 'updateTime', u.updateAt) user
FROM moment m
LEFT JOIN user u ON u.id = m.user_id
LIMIT 10 OFFSET 0;

SELECT 
	m.id id, m.content content, m.createAt createTime, m.updateAt updateTime,
	JSON_OBJECT('id', u.id, 'name', u.name, 'createTime', u.createAt, 'updateTime', u.updateAt) user
FROM moment m
LEFT JOIN user u ON u.id = m.user_id
WHERE m.id = 1;

-- 修改动态
SELECT * FROM moment WHERE id = 1 AND user_id = 7;
UPDATE moment SET content = '哈哈哈' WHERE id = 1;
-- 删除动态
DELETE FROM moment WHERE id = ?;




-- 3.创建comment(评论)表
CREATE TABLE IF NOT EXISTS `comment`(
	id INT PRIMARY KEY AUTO_INCREMENT,
	content VARCHAR(1000) NOT NULL,
	moment_id INT NOT NULL,
	user_id INT NOT NULL,
	comment_id INT DEFAULT NULL,
	createAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	
	FOREIGN KEY(moment_id) REFERENCES moment(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(user_id) REFERENCES user(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(comment_id) REFERENCES comment(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 插入评论
INSERT INTO comment (content, moment_id, user_id) VALUES (?, ?, ?);
