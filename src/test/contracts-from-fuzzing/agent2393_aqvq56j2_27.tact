struct Alpha {
    x: Int;
    y: Bool;
    z: String;
}

struct Beta {
    alpha: Alpha;
    message: String?;
}

struct Gamma {
    b: Beta;
    comment: String;
}

contract Layers {
    g: Gamma = Gamma{
        b: Beta{ alpha: Alpha{ x:1, y:true, z:"Test" }, message: null },
        comment: "Done"
    };
}