message(0xABCD1234) SubMsg {
    x: Int;
    y: Bool;
}

struct Container {
    title: String;
    payload: SubMsg;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            title: "msg",
            payload: SubMsg{x:10, y:true},
        };
    }
}