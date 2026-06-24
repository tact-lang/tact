struct HasInts { int1: Int as uint32; int2: Int as int16; int3: Int as uint4; }

contract SerializeMix {
    val: HasInts;
    init() {
        self.val = HasInts{ int1: 1, int2: -2, int3: 3 };
    }
}