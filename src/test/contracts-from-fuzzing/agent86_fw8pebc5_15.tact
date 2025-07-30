struct Embed {
    val: Int;
    flag: Bool;
}

struct Container {
    embed1: Embed;
    embed2: Embed;
    embed3: Embed;
}

contract TestContract {
    cont: Container;

    init() {
        self.cont = Container{
            embed1: Embed{val:1, flag:true},
            embed2: Embed{val:2, flag:false},
            embed3: Embed{val:3, flag:true},
        };
    }
}