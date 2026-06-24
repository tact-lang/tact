message Outer {
    inner: Bool; // smaller data, directly a Bool
}

contract BounceNestedSimplified {
    bounced(msg: bounced<Outer>) {
        let b: Bool = msg.inner;
        self.reply(b ? "true".asComment() : "false".asComment());
    }
}
