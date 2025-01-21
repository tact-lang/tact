/// Describes the base logic that is available in all contracts and traits by default.
///
/// This trait is implicitly inherited by every other contract and trait.
/// It contains a number of the most useful internal functions for any kind of contract,
/// and a constant `self.storageReserve` aimed at advanced users of Tact.
///
/// See: https://docs.tact-lang.org/ref/core-base/
trait BaseTrait {
    /// The amount of nanoToncoins to reserve before forwarding a message with 
    /// `SendRemainingBalance` mode. Default is 0 (no reserve).
    ///
    /// ```tact
    /// contract AllYourStorageBelongsToUs {
    ///     // This would change the behavior of `self.forward()` function,
    ///     // causing it to try reserving this amount of nanoToncoins before
    ///     // forwarding a message with `SendRemainingBalance` mode
    ///     override const storageReserve: Int = ton("0.1");
    /// }
    /// ```
    ///
    /// See: https://docs.tact-lang.org/ref/core-base/#self-forward
    virtual const storageReserve: Int = 0;
    
    /// Sends a bounceable message back to the sender of the current message.
    /// An alias function to calling the `self.forward()` function with
    /// the following arguments:
    ///
    /// ```tact
    /// self.forward(sender(), body, true, null);
    ///              ↑         ↑     ↑     ↑
    ///              |         |     |     init: StateInit?
    ///              |         |     bounce: Bool
    ///              |         body: Cell?
    ///              to: Address
    /// ```
    virtual inline fun reply(body: Cell?) {
        self.forward(sender(), body, true, null);
    }

    /// Sends a non-bounceable message back to the sender of the current message.
    /// An alias function to calling the `self.forward()` function with
    /// the following arguments:
    ///
    /// ```tact
    /// self.forward(sender(), body, false, null);
    ///              ↑         ↑     ↑     ↑
    ///              |         |     |     init: StateInit?
    ///              |         |     bounce: Bool
    ///              |         body: Cell?
    ///              to: Address
    /// ```
    virtual inline fun notify(body: Cell?) {
        self.forward(sender(), body, false, null);
    }

    /// Queues the message (bounceable or non-bounceable) to be sent to the specified address `to`.
    /// Optionally, you may provide a `body` of the message and the `init` package with `initOf`.
    /// 
    /// When `self.storageReserve` constant is overwritten to be greater than zero, before sending a
    /// message it also tries to reserve the `self.storageReserve` amount of nanoToncoins from the
    /// remaining balance before making the send in the `SendRemainingBalance` (128) mode.
    ///
    /// In case reservation attempt fails and in the default case without the attempt, the message 
    /// is sent with the `SendRemainingValue` (64) mode instead.
    ///
    /// > Note that `self.forward()` never sends additional nanoToncoins on top of what’s available on the balance.
    /// > To be able to send more nanoToncoins with a single message, use the the `send` function.
    ///
    /// See: https://docs.tact-lang.org/ref/core-base/#self-forward for examples.
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
                send(SendParameters{
                    bounce,
                    to,
                    value: 0,
                    mode: SendRemainingBalance | SendIgnoreErrors,
                    body,
                    code,
                    data,
                });
                return;
            }
        }

        // Just send with remaining balance
        send(SendParameters{
            bounce,
            to,
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body,
            code,
            data,
        });
    }
}
