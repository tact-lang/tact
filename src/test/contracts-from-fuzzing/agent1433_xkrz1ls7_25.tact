struct Embed {
    a: Int;
    b: Bool;
    c: String;
}

struct Holder {
    item: Embed?;
    count: Int;
}

contract TestContract {
    data: Holder;
    init() {
        self.data = Holder{
            item: Embed{ a:42,b:true,c:"abc" },
            count: 1
        };
    }
}