struct Inner1 { x: Int; y: Int }
struct Inner2 { flag: Bool; name: String }
struct Container {
    first: Inner1;
    second: Inner2;
}

contract StructFields {
    store: Container;

    init() {
        self.store = Container{
            first: Inner1{x: 5, y: 10},
            second: Inner2{flag:true, name:"abc"},
        };
    }
}