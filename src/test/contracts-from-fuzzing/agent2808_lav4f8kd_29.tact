struct Nest1 {
    a: Int;
    b: Nest2;
}

struct Nest2 {
    c: Bool;
    d: Nest3;
}

struct Nest3 {
    e: Slice;
}

contract Test {
    val: Nest1;
    init() {
        self.val = Nest1{
            a:5,
            b:Nest2{c:true,d:Nest3{e:slice("te6cckEBAQEADgAAGEhlbGxvIHdvcmxkIXgtxbw=")}}
        };
    }
}