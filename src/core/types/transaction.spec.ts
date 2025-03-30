/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { beginCell } from "../boc/builder";
import { Cell } from "../boc/cell";
import { loadTransaction, storeTransaction } from "./transaction";

describe("Transaction", () => {
    it("should parse transaction", () => {
        // Source: https://explorer.toncoin.org/transaction?account=EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N&lt=22901965000001&hash=E9FB666FD65E2D70479C5A2C2EC412AD08D68FCDF57676B3BAA34AADA3C95DB8
        const boc =
            "te6cckECCgEAAlMAA7V4Pf1VLmNym0cvy8yMRevMZpFwJVi2jsdSfhukA6DzGoAAAU1Ed9DUFmPJqTvOirSq2SKzYQ5GyQgvd9+38bqLQeGJ8YYrkwEwAAFNRGeacBYYzLegADRpVFhoAQIDAgHgBAUAgnKs+GZiNansGUYB+rKGLa25KuWgzm0WaeC5p+NLonoeFBg7+If0w+KZtCRH5Mx+9HCC8Pihk1IvrTPyRowEaTRLAg8MQMYZbXqEQAgJAd+IAQe/qqXMblNo5fl5kYi9eYzSLgSrFtHY6k/DdIB0HmNQB3H/g30bYqz72JAcnKJjRhgkmca92JLgIBGap3csfDt4Jk4S1186lCTQKuGZLHb97aw106oJRO8jslWF11AnUCFNTRi7DGZdIAAAAIAcBgEB3wcAdEIACasmTDZcDR+1HcxuZZBHXmDDvLMcX2Eijok8WCLyCyEwSMJzlQAAAAAAAAAAAAAAAAAAAAAAAAAAvUgBB7+qpcxuU2jl+XmRiL15jNIuBKsW0djqT8N0gHQeY1EABNWTJhsuBo/ajuY3MsgjrzBh3lmOL7CRR0SeLBF5BZCYJGE5yoAABhRYYAAAKaiO+hqEwxmW9AAAAABAAJ1BdkMTiAAAAAAAAAAAEIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAG/Jh6EgTBRYQAAAAAAAAgAAAAAAA4SB9Dp1g8lBEAkVf+gygVyC7sUl7wdSG9SEX3iBd2MqQFAXjC98i7E=";
        const cell = Cell.fromBoc(Buffer.from(boc, "base64"))[0]!;
        const tx = loadTransaction(cell.beginParse());
        const cell2 = beginCell().store(storeTransaction(tx)).endCell();
        expect(cell.equals(cell2)).toBe(true);
    });
    it("should parse transaction and hash", () => {
        // Source: https://explorer.toncoin.org/transaction?account=EQCD39VS5jcptHL8vMjEXrzGaRcCVYto7HUn4bpAOg8xqB2N&lt=22901965000001&hash=E9FB666FD65E2D70479C5A2C2EC412AD08D68FCDF57676B3BAA34AADA3C95DB8
        const boc =
            "te6cckECCgEAAlMAA7V4Pf1VLmNym0cvy8yMRevMZpFwJVi2jsdSfhukA6DzGoAAAU1Ed9DUFmPJqTvOirSq2SKzYQ5GyQgvd9+38bqLQeGJ8YYrkwEwAAFNRGeacBYYzLegADRpVFhoAQIDAgHgBAUAgnKs+GZiNansGUYB+rKGLa25KuWgzm0WaeC5p+NLonoeFBg7+If0w+KZtCRH5Mx+9HCC8Pihk1IvrTPyRowEaTRLAg8MQMYZbXqEQAgJAd+IAQe/qqXMblNo5fl5kYi9eYzSLgSrFtHY6k/DdIB0HmNQB3H/g30bYqz72JAcnKJjRhgkmca92JLgIBGap3csfDt4Jk4S1186lCTQKuGZLHb97aw106oJRO8jslWF11AnUCFNTRi7DGZdIAAAAIAcBgEB3wcAdEIACasmTDZcDR+1HcxuZZBHXmDDvLMcX2Eijok8WCLyCyEwSMJzlQAAAAAAAAAAAAAAAAAAAAAAAAAAvUgBB7+qpcxuU2jl+XmRiL15jNIuBKsW0djqT8N0gHQeY1EABNWTJhsuBo/ajuY3MsgjrzBh3lmOL7CRR0SeLBF5BZCYJGE5yoAABhRYYAAAKaiO+hqEwxmW9AAAAABAAJ1BdkMTiAAAAAAAAAAAEIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAG/Jh6EgTBRYQAAAAAAAAgAAAAAAA4SB9Dp1g8lBEAkVf+gygVyC7sUl7wdSG9SEX3iBd2MqQFAXjC98i7E=";
        const cell = Cell.fromBoc(Buffer.from(boc, "base64"))[0]!;
        const tx = loadTransaction(cell.beginParse());

        expect(tx.hash().toString("hex")).toEqual(cell.hash().toString("hex"));
        expect(tx.raw.equals(cell)).toBe(true);
    });
    it("should parse tick/tock transactions", () => {
        // Source: https://explorer.toncoin.org/transaction?account=Ef80UXx731GHxVr0-LYf3DIViMerdo3uJLAG3ykQZFjXz2kW&lt=23019612000003&hash=36c7dbbb0cc6bf250e1265064c6c85751f8c838bea7caa58a9e62db03ea5d004
        const boc =
            "te6cckECBgEAATIAA69zRRfHvfUYfFWvT4th/cMhWIx6t2je4ksAbfKRBkWNfPAAAU76vLzwNWZ7xZALK0LgKzOhLytPsuTA0xeefgUOOoutURmfnnowAAFO+ry88BYZJ8ZwABQIAQIDAAEgAIJylqTCiKw1AYPxh8CsC3VDbY7yFlU0TmTCts3A0+5em+JY4alwBNV+0DtCbXo8QiEQ9DmV3wfpinUd6ThveMbXjwIFMDA0BAUAnkJmTmJaAAAAAAAAAAAAMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaWAAAACWAAAABAAGAAAAAAAFGa6E8XuPiyICapdf9V8asZ/eSnaHRNIXjfpju1M+EHpAkCa8Fcsu4Q==";
        const cell = Cell.fromBoc(Buffer.from(boc, "base64"))[0]!;
        const tx = loadTransaction(cell.beginParse());
        const cell2 = beginCell().store(storeTransaction(tx)).endCell();
        expect(cell.equals(cell2)).toBe(true);
    });
    it("should parse state init transaction", () => {
        const boc = `te6cckECDAEAAu4AA7V898cPGd+25qY9UQrwuX9qrBpR1LR8TLjI6rQdNfeUEuAAAVKVz+HYEWZHs5hb3tPdVm6TyS0dYFMNN3PGKg8TV6Jgm5arcIAAAAFSdO3MjDYZ6HTQACRr/CkIAQIDAgHgBAUAgnLohCe0UvXyi7CExAkb9KB7KAKBd6TEhWHteK/pi8qfDA5KuYdIiud3mWwWCASe/Ka43A8FgsOgF8hL4KarrIkkAhEMgEIGGW16hEAKCwPhiAGe+OHjO/bc1MeqIV4XL+1Vg0o6lo+JlxkdVoOmvvKCXBGNQVPKLsIFvTtEsIAl4RIi2DTiB0eU25iJf1147ysJs7Vy6LRM2H5IYI8F+UOC6bDfjx64ZwQoFP2bvzSbTIphhTU0Yuwz0O9AAAAAAHAGBwgBAd8JAN7/ACDdIIIBTJe6IYIBM5y6sZ9xsO1E0NMf0x8x1wv/4wTgpPJggwjXGCDTH9Mf0x/4IxO78mPtRNDTH9Mf0//RUTK68qFRRLryogT5AVQQVfkQ8qP4AJMg10qW0wfUAvsA6NEBpMjLH8sfy//J7VQAUAAAAAApqaMXiOOuWdrrclMfTVlh2SoiW1/FeDcg77Wae9OQL/uLWpEAcGIAY5WvyYiEO64KphFdElBfUhViX8zkDYB0vInaJ+cCklIgF9eEAAAAAAAAAAAAAAAAAAAAAAAAALloAZ744eM79tzUx6ohXhcv7VWDSjqWj4mXGR1Wg6a+8oJdADHK1+TEQh3XBVMIrokoL6kKsS/mcgbAOl5E7RPzgUkpEAvrwgAGFFhgAAAqUrn8OwTDPQ6aAAAAAEAAnUF2QxOIAAAAAAAAAAAQgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAAb8mHoSBMFFhAAAAAAAACAAAAAAADAjkoeILAGVO2lRti7r53KaoKzdokjAnKg8yAJDgjQS5AUBcM2+JyJQ==`;
        const cell = Cell.fromBoc(Buffer.from(boc, "base64"))[0]!;
        const tx = loadTransaction(cell.beginParse());
        const cell2 = beginCell().store(storeTransaction(tx)).endCell();
        expect(cell.equals(cell2)).toBe(true);
    });
    it("should parse messages with external addresses", () => {
        // Source: https://explorer.toncoin.org/transaction?account=-1:a491d63f07ba7eefb4cb9f685484ce9089d5abaec97c15858222f04ca592a9ac&lt=22926061000001&hash=87572e72183eaa8be8dc0fb55921b0f6fbc02fa9e271ea7e2b21dcd76de3c26f
        const boc =
            "te6cckECCgEAAkUAA7d6SR1j8Hun7vtMufaFSEzpCJ1auuyXwVhYIi8EylkqmsAAAU2eO41UEeRJr6vFqCcKIH/At25aJERfuKnnFNvEUGZfZXngcMFgAAFNniDZZBYY3z6QADSAmSAlCAUEAQITDJIthiAa0nSEQAMCAG/JzEtATMtyiAAAAAAAAgAAAAAAA5JB3YvT7VrkPXxN485b+s1ZzT6izdF5jCfNCmC9DSz0QFAWTACdQr8jE4gAAAAAAAAAACDAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAIACCciw0bvSHQSzpSCq6INjDyTZ0z/6sSWYTMKFYrSQ9Wna3V4riNEWKRC5izQTxkFRpyfO/HYX80uSsctpuApvP8ucCAeAIBgEB3wcAs0n/SSOsfg90/d9plz7QqQmdIROrV12S+CsLBEXgmUslU1kAMKD3eVRXGaUISSzmQvyNMVyqDyUSV8CLx1J57yPaMUMUXSHboAAGy3O8AAAps8dxqoTDG+fSQAFKkFAbP+kkdY/B7p+77TLn2hUhM6QidWrrsl8FYWCIvBMpZKprAQkA8k1pbmUAYY33HsKD3eVRXGaUISSzmQvyNMVyqDyUSV8CLx1J57yPaMUMXlJVe7JQw1jSHC/5YUf/q2idXQh6cYVEjRYxL1YGO0JsibseRbOvoYvImYC6fmv2XlJVe7JQw1jSHC/5YUf/q2idXQh6cYVEjRYxL1YGO0KwLxvj";
        const cell = Cell.fromBoc(Buffer.from(boc, "base64"))[0]!;
        const tx = loadTransaction(cell.beginParse());
        const cell2 = beginCell().store(storeTransaction(tx)).endCell();
        expect(cell.equals(cell2)).toBe(true);
    });
});
