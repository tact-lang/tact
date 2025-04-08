struct SerializeMix {
    a: Int as uint8;
    b: Int as coins;
    c: Int as int64;
    d: Bool;
}

contract SerializeMixContract {
    data: SerializeMix = SerializeMix{a:1,b:2,c:3,d:true};
    receive() {
        let _ = self.data.c;
    }
}