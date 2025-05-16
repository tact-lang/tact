struct Base {
    x: Int;
    y: Bool?;
    z: String;
}

struct Mid {
    inner: Base;
    flag: Bool;
}

struct Top {
    m: Mid;
    optional_s: String?;
}

contract TopContract {
    container: Top;
    init() {
        self.container = Top{
            m: Mid{
                inner: Base{x: 1, y: null, z: "hi"},
                flag: true
            },
            optional_s: null
        };
    }
}