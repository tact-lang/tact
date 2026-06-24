struct HasString {
    text: String;
}

struct HasStringOpt {
    s: HasString?;
}

contract StringOptional {
    val: HasStringOpt;

    init() {
        self.val = HasStringOpt{s: null};
    }
}