struct Layers {
    first: Int;
    second: Int?;
    third: Int;
    fourth: Int?;
}

contract LayersOfOptionals {
    layer: Layers;

    init() {
        self.layer = Layers{
            first: 1,
            second: null,
            third: 3,
            fourth: null
        };
    }
}