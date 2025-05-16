struct DeeplyNested1 {
    a: Int;
}
struct DeeplyNested2 {
    b: DeeplyNested1;
}
struct DeeplyNested3 {
    c: DeeplyNested2;
}
struct DeeplyNested4 {
    d: DeeplyNested3;
}
struct DeeplyNested5 {
    e: DeeplyNested4;
}

contract NestDepth5 {
    nest: DeeplyNested5;

    init() {
        self.nest = DeeplyNested5{ e: DeeplyNested4{ d: DeeplyNested3{ c: DeeplyNested2{ b: DeeplyNested1{a:5} } } } };
    }
}