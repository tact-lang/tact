trait BaseTrait {
    virtual inline fun reply(body: Cell?) {
        send(SendParameters{
            bounce: true,
            to: sender(),
            value: 0,
            mode: SendRemainingValue + SendIgnoreErrors, 
            body: body
        });
    }
}