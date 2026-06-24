struct Info {
    name: String;
    age: Int?;
    flag: Bool;
}

contract StructParamTest(
    info: Info,
    extra: Int?
) {
    receive() {
        dump(self.info.name);
        dump(self.info.age);
        dump(self.info.flag);
        dump(self.extra);
    }
}