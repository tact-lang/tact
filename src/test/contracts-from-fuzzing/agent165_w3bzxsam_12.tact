struct Inner1 {
    a: Int
}
struct Inner2 {
    b: Int
}
struct Inner3 {
    c: Int
}

struct Wrapper {
    x: Inner1; y: Inner2; z: Inner3; s: String;
}

contract MultiStructs {
    data: Wrapper;
    init(){
        self.data = Wrapper{
            x: Inner1{a: 1}, y: Inner2{b: 2}, z: Inner3{c:3}, s: "ok"
        };
    }
}