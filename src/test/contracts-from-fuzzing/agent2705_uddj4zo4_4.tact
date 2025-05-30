struct MaybeCoords {
    x: Int?;
    y: Int?;
}

contract OptStruct {
    coords: MaybeCoords = MaybeCoords{
        x: null,
        y: 10
    };
}