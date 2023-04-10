trait BaseTrait {
    virtual const storageReserve: Int = 0;
    
    virtual inline fun reply(body: Cell?) {
        self.forward(sender(), body);
    }

    virtual fun forward(to: Address, body: Cell?) {
        
        // Lock storage if needed
        if (self.storageReserve > 0) { // Optimized in compile-time
            let ctx: Context = context();
            let balance: Int = myBalance();
            let balanceBeforeMessage: Int = balance - ctx.value;
            if (balanceBeforeMessage < self.storageReserve) {
                nativeReserve(self.storageReserve, 0);
                send(SendParameters{bounce: true, to: to, value: 0, mode: SendRemainingBalance + SendIgnoreErrors, body: body });
                return;
            }
        }

        // Just send with remaining balance
        send(SendParameters{bounce: true, to: to, value: 0, mode: SendRemainingValue + SendIgnoreErrors, body: body });
    }
}