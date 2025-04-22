/// Describes the base logic that is available in all contracts and traits by default.
///
/// This trait is implicitly inherited by every other contract and trait.
/// It contains a number of the most useful internal functions for any kind of contract,
/// and a constant `self.storageReserve` aimed at advanced users of Tact.
///
/// See: https://docs.tact-lang.org/ref/core-base/
/// 
struct MessageParametersWithoutBounce {
    /// An 8-bit value that configures how to send a message, defaults to 0.
    /// See: https://docs.tact-lang.org/book/message-mode
    mode: Int = SendDefaultMode;

    /// Optional message body as a `Cell`.
    body: Cell? = null;

    /// The amount of nanoToncoins you want to send with
    /// the message. This value is used to cover forward fees,
    /// unless the optional flag `SendPayFwdFeesSeparately` is used.
    value: Int;

    /// Recipient internal `Address` on TON Blockchain.
    to: Address;
}


struct MessageParametersWithoutBounceWithoutValue{
    /// An 8-bit value that configures how to send a message, defaults to 0.
    /// See: https://docs.tact-lang.org/book/message-mode
    mode: Int = SendDefaultMode;

    /// Optional message body as a `Cell`.
    body: Cell? = null;

    /// Recipient internal `Address` on TON Blockchain.
    to: Address;
}

asm fun messageBounceTrue(params: MessageParametersWithoutBounce) {
    NEWC
    b{011000} STSLICECONST  // store tag = $0, ihr_disabled = true, bounce = true,  bounced = false, src = addr_none
    STSLICE             // store `to`
    SWAP
    STGRAMS             // store `value`
    106 PUSHINT         // 1 + 4 + 4 + 64 + 32 + 1
    STZEROES
    // → Stack state
    // s0: Builder
    // s1: `data`
    // s2: `code`
    // s3: `body`
    // s4: `mode`
    STDICT
    ENDC
    SWAP
    SENDRAWMSG
}

asm fun messageBounceFalse(params: MessageParametersWithoutBounce) {
    NEWC
    b{010000} STSLICECONST  // store tag = $0, ihr_disabled = true, bounce = false,  bounced = false, src = addr_none
    STSLICE             // store `to`
    SWAP
    STGRAMS             // store `value`
    106 PUSHINT         // 1 + 4 + 4 + 64 + 32 + 1
    STZEROES
    // → Stack state
    // s0: Builder
    // s1: `data`
    // s2: `code`
    // s3: `body`
    // s4: `mode`
    STDICT
    ENDC
    SWAP
    SENDRAWMSG
}

asm fun messageBounceTrueValueZero(params: MessageParametersWithoutBounceWithoutValue) {
    NEWC
    b{011000} STSLICECONST  // store tag = $0, ihr_disabled = true, bounce = true,  bounced = false, src = addr_none
    STSLICE             // store `to`
    x{0} STSLICECONST   // store `value` = 0
    106 PUSHINT         // 1 + 4 + 4 + 64 + 32 + 1
    STZEROES
    // → Stack state
    // s0: Builder
    // s1: `data`
    // s2: `code`
    // s3: `body`
    // s4: `mode`
    STDICT
    ENDC
    SWAP
    SENDRAWMSG
}


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
    /// See: https://docs.tact-lang.org/ref/core-base#self-forward
    ///
    virtual const storageReserve: Int = 0;

    /// Sends a bounceable message back to the sender of the current message.
    /// A similar but more gas-efficient version of calling the `self.forward()`
    /// function with the following arguments:
    ///
    /// ```tact
    /// self.forward(sender(), body, true, null);
    /// //           ↑         ↑     ↑     ↑
    /// //           |         |     |     init: StateInit?
    /// //           |         |     bounce: Bool
    /// //           |         body: Cell?
    /// //           to: Address
    /// ```
    ///
    /// See: https://docs.tact-lang.org/ref/core-base#self-forward
    ///
    virtual inline fun reply(body: Cell?) {
        if (self.storageReserve > 0) { // Optimized in compile-time
            let balance: Int = myBalance();
            let balanceBeforeMessage: Int = balance - context().value;
            if (balanceBeforeMessage < self.storageReserve) {
                nativeReserve(self.storageReserve, ReserveExact);
                messageBounceTrueValueZero(MessageParametersWithoutBounceWithoutValue {
                    to: sender(),
                    mode: SendRemainingBalance | SendIgnoreErrors,
                    body,
                });
                return;
            }
        }

        // Just send with remaining balance
        messageBounceTrueValueZero(MessageParametersWithoutBounceWithoutValue {
            to: sender(),
            mode: SendRemainingValue | SendIgnoreErrors,
            body,
        });
    }

    /// Sends a non-bounceable message back to the sender of the current message.
    /// A similar but more gas-efficient version of calling the `self.forward()`
    /// function with the following arguments:
    ///
    /// ```tact
    /// self.forward(sender(), body, false, null);
    /// //           ↑         ↑     ↑     ↑
    /// //           |         |     |     init: StateInit?
    /// //           |         |     bounce: Bool
    /// //           |         body: Cell?
    /// //           to: Address
    /// ```
    ///
    /// See: https://docs.tact-lang.org/ref/core-base#self-forward
    ///
    virtual inline fun notify(body: Cell?) {
        if (self.storageReserve > 0) { // Optimized in compile-time
            let balance: Int = myBalance();
            let balanceBeforeMessage: Int = balance - context().value;
            if (balanceBeforeMessage < self.storageReserve) {
                nativeReserve(self.storageReserve, ReserveExact);
                messageBounceFalse(MessageParametersWithoutBounce {
                    to: sender(),
                    value: 0,
                    mode: SendRemainingBalance | SendIgnoreErrors,
                    body,
                });
                return;
            }
        }

        // Just send with remaining balance
        messageBounceFalse(MessageParametersWithoutBounce {
            to: sender(),
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body,
        });
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
    /// See: https://docs.tact-lang.org/ref/core-base#self-forward
    ///
    virtual fun forward(to: Address, body: Cell?, bounce: Bool, init: StateInit?) {
        if (init == null) {
            // Lock storage if needed
            if (self.storageReserve > 0) { // Optimized in compile-time
                let ctx: Context = context();
                let balance: Int = myBalance();
                let balanceBeforeMessage: Int = balance - ctx.value;
                if (balanceBeforeMessage < self.storageReserve) {
                    nativeReserve(self.storageReserve, ReserveExact);
                    message(MessageParameters {
                        bounce,
                        to,
                        value: 0,
                        mode: SendRemainingBalance | SendIgnoreErrors,
                        body,
                    });
                    return;
                }
            }

            // Just send with remaining balance
            message(MessageParameters {
                bounce,
                to,
                value: 0,
                mode: SendRemainingValue | SendIgnoreErrors,
                body,
            });
            return;
        }

        // Lock storage if needed
        if (self.storageReserve > 0) { // Optimized in compile-time
            let ctx: Context = context();
            let balance: Int = myBalance();
            let balanceBeforeMessage: Int = balance - ctx.value;
            if (balanceBeforeMessage < self.storageReserve) {
                nativeReserve(self.storageReserve, ReserveExact);
                send(SendParameters {
                    to,
                    mode: SendRemainingBalance | SendIgnoreErrors,
                    body,
                    value: 0,
                    bounce,
                    code: init!!.code,
                    data: init!!.data,
                });
                return;
            }
        }

        // Just send with remaining balance
        send(SendParameters {
            bounce,
            to,
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body,
            code: init!!.code,
            data: init!!.data,
        });
    }
}
