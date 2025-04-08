struct MessageLike {
    x: Int;
    y: Bool;
}

contract StructWithStruct {
    store: MessageLike = MessageLike{x:5,y:true};

    init() {
        self.store = MessageLike{x:42,y:false};
    }

    receive() {
        let _ = self.store;
    }
}