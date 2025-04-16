// optional string at top, nested struct below
struct NestedInfo {
    flag: Bool;
    txt: String;
}

contract MixOpt {
    title: String?;
    info: NestedInfo;
    init() {
        self.title = null;
        self.info = NestedInfo{flag: true, txt: "hello"};
    }
}
