// contract with large nested struct that mixes scalar and optional
struct Nested {
    val: Int;
    opt: Bool?;
    txt: String;
}
struct Container {
    nested: Nested;
    flag: Bool;
    msg: String?;
}

contract Test {
    c: Container;

    init() {
        self.c = Container{
            nested: Nested{
                val: 1,
                opt: null,
                txt: "abc"
            },
            flag: true,
            msg: null
        };
    }
}