struct Alpha {
    x: Int;
    y: Bool;
}

struct Beta {
    nested: Alpha;
    opt: Alpha?;
}

struct Gamma {
    data: Beta;
}

contract OptInNest {
    store: Gamma;

    init() {
        self.store = Gamma{
            data: Beta{
                nested: Alpha{ x:1, y:true },
                opt: null,
            },
        };
    }
}
