struct SerializedOptional {
    optVal: Int? as uint32;
}

contract OptSerTest {
    s: SerializedOptional;

    init() {
        self.s = SerializedOptional{ optVal: null };
    }
}