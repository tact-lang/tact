trait BaseTrait {
    virtual const storageReserve: Int = 0;

    fun sendmsg(to: Address, body: Cell, bounce: Bool, mode: Int, stateInit: StateInit?) {
        let value: Int = 0;
        
        if (stateInit != null) {
            let sinit: StateInit = stateInit!!;
            send(to, value, bounce, mode, body, sinit.code, sinit.data);
        } else {
            send(to, value, bounce, mode, body);
        }
    }
    
    virtual inline fun reply(body: Cell) {
        self.forward(sender(), body, true, null);
    }

    virtual inline fun notify(body: Cell) {
        self.forward(sender(), body, false, null);
    }

    virtual fun forward(to: Address, body: Cell, bounce: Bool, stateInit: StateInit?) {
        if (self.storageReserve > 0) { // Optimized in compile-time
            let ctx: Context = context();
            let balance: Int = myBalance();
            let balanceBeforeMessage: Int = balance - ctx.value;

            if (balanceBeforeMessage < self.storageReserve) {
                nativeReserve(self.storageReserve, ReserveExact);

                let mode: Int = SendRemainingBalance | SendIgnoreErrors;
                self.sendmsg(to, body, bounce, mode, stateInit);

                return;
            }
        }

        let mode: Int = SendRemainingValue | SendIgnoreErrors;
        self.sendmsg(to, body, bounce, mode, stateInit);
    }
}