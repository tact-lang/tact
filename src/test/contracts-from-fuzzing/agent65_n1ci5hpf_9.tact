struct DeepChild {
    x: Int;
}

struct DeepOptional {
    child: DeepChild?;
}

contract TestDeepOptional {
    receive() {
        // Instantiate DeepOptional with some value in the optional child
        let s = DeepOptional { child: DeepChild { x: 77 } };
        // Instantiate DeepOptional with no child
        let t = DeepOptional { child: null };
    }
}
