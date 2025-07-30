struct Mapped {
    mapInside: map<Int, Int>;
}

contract MapStruct {
    m: Mapped;
    init() {
        self.m = Mapped{mapInside: emptyMap()};
    }
}