struct MultLevelsOpt1 {
    x: Int?;
}
struct MultLevelsOpt2 {
    y: MultLevelsOpt1?;
}
struct MultLevelsOpt3 {
    z: MultLevelsOpt2?;
}

contract TestContract {
    nest: MultLevelsOpt3;

    init() {
        self.nest = MultLevelsOpt3{ z: null };
    }
}