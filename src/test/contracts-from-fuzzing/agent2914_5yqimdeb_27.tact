struct SerializeMix {
    a: Int as uint3;
    b: Int as int7;
    c: Int as uint1;
    d: Int as int257;
}

contract SerializeMixContract {
    val: SerializeMix;

    init() {
        self.val = SerializeMix{ a:4, b:5, c:1, d:1000000 };
    }
}