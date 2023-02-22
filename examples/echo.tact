contract Echo {

    init() {
        
    }
    
    receive(msg: String) {
        reply(msg.asComment());
    }
    
    receive(msg: Slice) {
        reply(msg.asCell());
    }

    get fun hello(src: String): String {
        let builder: StringBuilder = beginString();
        builder.append("Hello, ");
        builder.append(src);
        return builder.toString();
    }
}