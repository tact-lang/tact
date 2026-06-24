struct Int64s {
    a: Int as int64;
    b: Int as int64;
    c: Int as int64;
    d: Int as int64;
    e: Int as int64;
}

contract Int64Store {
    vals: Int64s;

    init() {
        self.vals = Int64s{
            a:1,b:2,c:3,d:4,e:5
        };
    }
}
