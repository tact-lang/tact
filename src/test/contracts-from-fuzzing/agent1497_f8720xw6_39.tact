// Large nested flatten struct with mixed types
struct Sub {
    a: Int;
    b: Bool;
    c: String;
}

struct Container {
    s1: Sub;
    s2: Sub;
}

contract TestContract {
    data: Container = Container{
        s1: Sub{ a:1, b:false, c:"x" },
        s2: Sub{ a:2, b:true,  c:"y" }
    };
}