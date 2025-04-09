message(123) InnerMsg {
    foo: Int;
}

struct Container {
    data: InnerMsg;
    label: String;
}

contract MsgInStruct {
    field: Container = Container{data:InnerMsg{foo:0}, label:""};

    init() {
        self.field = Container{data:InnerMsg{foo:1}, label:"x"};
    }
}