struct Pair {
    id: Int;
    name: String;
}

struct Duo {
    first: Pair;
    second: Pair;
}

struct Triple {
    duo: Duo;
    another: Pair;
}

contract DeepTriple {
    content: Triple;

    init() {
        self.content = Triple{
            duo: Duo{
                first: Pair{ id:1, name:"x" },
                second: Pair{ id:2, name:"y" }
            },
            another: Pair{ id:3, name:"z" }
        };
    }
}