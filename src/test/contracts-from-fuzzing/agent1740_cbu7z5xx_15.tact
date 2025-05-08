struct SSub {
    val: Int;
}

struct SEmbed {
    s1: SSub;
    s2: SSub;
}

contract EmbeddedStructs {
    val: SEmbed;

    init() {
        self.val = SEmbed {
            s1: SSub { val: 11 },
            s2: SSub { val: 22 }
        };
    }
}