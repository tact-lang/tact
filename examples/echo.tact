message EchoMessage {}

contract Echo {
    receive(msg: EchoMessage) {
        self.reply(msg.toCell());
    }
    
    receive(msg: String) {
        self.reply(msg.asComment());
    }
    
    receive(msg: Slice) {
        self.reply(msg.asCell());
    }

    get fun hello(src: String): String {
        let builder: StringBuilder = beginString();
        builder.append("Hello, ");
        builder.append(src);
        return builder.toString();
    }

    get fun hello2(src: Int): Int {
        return src << 10 & 32;
    }
}
