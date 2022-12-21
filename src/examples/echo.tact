contract Echo {

    v: Int = 0;
    
    receive(msg: String) {
        reply(msg.asComment());
    }
    
    receive(msg: Slice) {
        let builder: Builder = beginCell();
        builder = storeSlice(builder, msg);
        reply(endCell(builder));
    }
}