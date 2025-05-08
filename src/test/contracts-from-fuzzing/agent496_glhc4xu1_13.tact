struct SubData {
    subStr: String;
    subOptInt: Int?;
}

struct MainData {
    title: String;
    optBool: Bool?;
    nested: SubData?;
}

contract StringNestOpt {
    data: MainData;

    init() {
        self.data = MainData{
            title: "Top",
            optBool: null,
            nested: null
        };
    }
}