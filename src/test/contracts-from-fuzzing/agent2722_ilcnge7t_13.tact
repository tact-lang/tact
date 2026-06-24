contract UnusualOrder {
    flag: Bool;
    id: Int;
    name: String;
    optNum: Int?;
    desc: String;
    active: Bool?;

    init() {
        self.flag = true;
        self.id = 5;
        self.name = "hello";
        self.optNum = null;
        self.desc = "desc";
        self.active = false;
    }
}