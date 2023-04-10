trait BaseTrait {
    virtual const test: Int = 0;
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