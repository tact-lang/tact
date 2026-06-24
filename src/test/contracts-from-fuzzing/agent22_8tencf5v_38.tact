// Contract nested deeply with explicit init, inner default, some null set
struct Last {
    a: Int?;
    b: String = "b";
}
struct Mid {
    last: Last?;
}
struct Top {
    mid: Mid?;
    name: String;
}

contract DeepExplicit {
    root: Top;

    init() {
        self.root = Top{
            mid: Mid{last:null},
            name: "deep"
        };
    }
}