struct Embed {
    a: Int as uint64;
    b: Int?;
}

struct Container {
    before: Int;
    embed: Embed;
    after: Int;
}

contract TestContract {
    val: Container;

    init() {
        self.val = Container{
            before: 1,
            embed: Embed{a:77,b:null},
            after: 2
        };
    }
}