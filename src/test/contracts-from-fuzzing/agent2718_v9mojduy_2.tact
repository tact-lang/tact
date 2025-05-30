struct DeepLevel {
    v: Int;
}

struct MidLevel {
    deep: DeepLevel;
}

contract MultiNested {
    mid: MidLevel = MidLevel{ deep: DeepLevel{ v: 0 } };
}