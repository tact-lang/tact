struct SubStruct {
    x: Int;
    y: Bool;
}

struct MixedEmbed {
    a: Int;
    b: Bool?;
    c: SubStruct;
    d: SubStruct?;
    e: String;
}

contract TestContract {
    data: MixedEmbed;

    init() {
        self.data = MixedEmbed{
            a:5,
            b:null,
            c: SubStruct{ x:1, y:true },
            d: null,
            e: "hi"
        };
    }
}