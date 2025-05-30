struct MessageStruct {
    flag: Bool;
    text: String;
}

struct TopStruct {
    integer: Int;
    inner: MessageStruct;
    optInner: MessageStruct?;
}

contract StructsOfStructs {
    content: TopStruct;
    init() {
        self.content = TopStruct{
            integer: 5,
            inner: MessageStruct{ flag:true, text:"hi" },
            optInner: null
        };
    }
}