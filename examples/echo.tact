contract Echo {

    v: Int = 0;
    
    receive(msg: String) {
        reply(msg.asComment());
    }
    
    receive(msg: Slice) {
        reply(msg.asCell());
    }
}