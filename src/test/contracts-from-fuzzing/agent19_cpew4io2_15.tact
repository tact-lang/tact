// Test 1: Basic typed bounce receiver
message MyMsg {
    dummy: Int;
}

contract BounceBasic {
    bounced(msg: bounced<MyMsg>) {
        // Minimal bounce handler as per documentation
    }
}

// Test 2: Raw slice bounce receiver
contract BounceRaw {
    bounced(rawMsg: Slice) {
        // Process raw bounced message, e.g., read bit length
        let b = rawMsg.bits();
    }
}

// Test 3: Bounce receiver that replies using self.reply
message ReplyMsg {
    info: String;
}

contract BounceReply {
    bounced(msg: bounced<ReplyMsg>) {
        // Reply when a bounce occurs
        self.reply("Bounce reply triggered".asComment());
    }
}

// Test 4: Bounce receiver using try...catch to handle a runtime error
message SmallBounceMsg {
    flag: Bool;
}

contract BounceTryCatch {
    bounced(msg: bounced<SmallBounceMsg>) {
        try {
            let d: Int = msg.flag ? 0 : 1;
            let x = 1 / d;
        } catch (e) {
            self.reply("Division error caught in bounced handler".asComment());
        }
    }
}
