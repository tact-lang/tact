struct DeepBot {
    intVal: Int;
    strVal: String;
}

struct MidBot {
    deep: DeepBot?;
}

contract NullDeepField {
    mid: MidBot;

    init() {
        self.mid = MidBot{ deep: null };
    }
}