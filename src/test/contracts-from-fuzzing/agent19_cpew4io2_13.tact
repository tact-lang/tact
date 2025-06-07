message SmallBounceMsg {
    flag: Bool;
}

contract BounceTestTryCatchFixed {
    bounced(msg: bounced<SmallBounceMsg>) {
        try {
            let d: Int = msg.flag ? 0 : 1;
            let x = 1 / d;
        } catch (e) {
            self.reply("Division error caught in bounced handler".asComment());
        }
    }
}
