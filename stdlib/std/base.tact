trait BaseTrait {
    virtual const storageReserve: Int = 0;
    
    virtual inline fun reply(body: Cell?) {
        self.forward(sender(), body, true, null);
    }

    virtual inline fun notify(body: Cell?) {
        self.forward(sender(), body, false, null);
    }

    virtual fun forward(to: Address, body: Cell?, bounce: Bool, init: StateInit?) {

        let code: Cell? = null;
        let data: Cell? = null;
        if (init != null) {
            let init2: StateInit = init!!;
            code = init2.code;
            data = init2.data;
        }

        // Lock storage if needed
        if (self.storageReserve > 0) { // Optimized in compile-time
            let ctx: Context = context();
            let balance: Int = myBalance();
            let balanceBeforeMessage: Int = balance - ctx.value;
            if (balanceBeforeMessage < self.storageReserve) {
                nativeReserve(self.storageReserve, ReserveExact);
                send(SendParameters{bounce: bounce, to: to, value: 0, mode: SendRemainingBalance | SendIgnoreErrors, body: body, code: code, data: data });
                return;
            }
        }

        // Just send with remaining balance
        send(SendParameters{bounce: bounce, to: to, value: 0, mode: SendRemainingValue | SendIgnoreErrors, body: body, code: code, data: data });
    }
}