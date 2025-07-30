struct MessageStruct {
    id: Int;
    name: String;
    active: Bool;
}

struct Wrapper {
    contained: MessageStruct;
    comment: String;
}

contract WrapTest {
    item: Wrapper;

    init() {
        self.item = Wrapper{
            contained: MessageStruct{id:1,name:"test",active:true},
            comment: "done"
        };
    }
}