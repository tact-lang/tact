struct VeryDeep {
    lvl: Int;
}

struct L4 {
    deep: VeryDeep;
}

struct L3 {
    deep: L4;
}

struct L2 {
    deep: L3;
}

struct L1 {
    deep: L2;
}

contract FiveLevelsDeep {
    s: L1;

    init() {
        self.s = L1{ deep: L2{ deep: L3{ deep: L4{ deep: VeryDeep{ lvl: 99 } } } } };
    }
}
