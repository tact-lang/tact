

// Request average of all numbers in the interval [from,to], inclusive.
// When the calculator sends the response back, it will pay the amount 
// amountToPayInResponse in the message value.
message AverageRequest {
    from: Int as uint32;
    to: Int as uint32;
    amountToPayInResponse: Int;
}

message AverageResult {
    res: Int as uint32;
}

// This contract computes averages and sends them back 
contract Calculator {

    // Used for deployment
    receive() {}

    // Note that passing a longer interval, e.g., [0,1000] will produce higher computation fees.
    // This is intentional for the test, in order to have control on the computation fees.
    receive(request: AverageRequest) {
        require(request.to - request.from >= 0, "There must exist at least one number in the interval.");
        let n = request.to - request.from + 1;
        let count = request.from;
        let sum = 0;
        while (count <= request.to) {
            sum += count;
            count += 1;
        }
        let result = sum / n;
        send(SendParameters{
            to: sender(),
            bounce: false,
            // SendDefaultMode with no flags is default
            value: request.amountToPayInResponse,
            body: AverageResult{res: result}.toCell(), 
            });
    }
}

// This message is used by the treasury to initiate the tests.
// It represents the data the MessageModeTester needs to start the test:
// - The interval to compute its average [from, to]
// - The amount the MessageModeTester will set in the request message value: amountToPayInRequest
// - The amount the calculator will set in the response message value: amountToPayInCalculatorResponse
message DoCalculatorRequest {
    from: Int as uint32;
    to: Int as uint32;
    amountToPayInRequest: Int;
    amountToPayInCalculatorResponse: Int;
}

contract MessageModeTester {

    // -1 means "initial state".
    // -2 means "error"
    // -3 means "op requested, no answer yet"
    // Non-negative values represent results of calculator computations.
    val: Int = -1;

    // Used for deployment
    receive() {}

    receive(msg: AverageResult) {
        self.val = msg.res;
    }

    bounced(msg: bounced<AverageRequest>) {
        self.val = -2;
    }
    
    get fun currentResult(): Int {
        return self.val;
    }

    // Instruct MessageModeTester to do a request to the calculator
    // Using default mode, no flags
    receive(msg: DoCalculatorRequest) {
        let addr = contractAddress(initOf Calculator());
        send(SendParameters{
                to: addr,
                bounce: true,
                value: msg.amountToPayInRequest,
                mode: SendDefaultMode,
                body: AverageRequest{from: msg.from, to: msg.to, amountToPayInResponse: msg.amountToPayInCalculatorResponse}.toCell(),
                });
        self.val = -3;
    }
}

