struct ComposeTypes {
    num: Int;
    flag: Bool;
    optNum: Int?;
    message: String;
    code: Cell;
    detail: DetailStruct;
}

struct DetailStruct {
    foo: Int;
    bar: Bool?;
}

contract TestContract {
    info: ComposeTypes;

    init() {
        self.info = ComposeTypes{
            num: 1,
            flag: false,
            optNum: null,
            message: "msg",
            code: emptyCell(),
            detail: DetailStruct{
                foo: 2,
                bar: null
            }
        };
    }
}