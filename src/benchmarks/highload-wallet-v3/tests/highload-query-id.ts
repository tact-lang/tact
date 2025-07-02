import { getRandomInt } from "@/benchmarks/highload-wallet-v3/tests/utils";

const BIT_NUMBER_SIZE = 10n; // 10 bit
// const SHIFT_SIZE = 13n; // 13 bit
export const MAX_BIT_NUMBER = 1022n;
export const MAX_SHIFT = 8191n; // 2^13 = 8192
export const MAX_KEY_COUNT = 1 << 13;

export class HighloadQueryId {
    private shift: bigint; // [0 .. 8191]
    private bitnumber: bigint; // [0 .. 1022]

    constructor() {
        this.shift = 0n;
        this.bitnumber = 0n;
    }

    static fromShiftAndBitNumber(
        shift: bigint,
        bitnumber: bigint,
    ): HighloadQueryId {
        const q = new HighloadQueryId();
        q.shift = shift;
        if (q.shift < 0) throw new Error("invalid shift");
        if (q.shift > MAX_SHIFT) throw new Error("invalid shift");
        q.bitnumber = bitnumber;
        if (q.bitnumber < 0) throw new Error("invalid bitnumber");
        if (q.bitnumber > MAX_BIT_NUMBER) throw new Error("invalid bitnumber");
        return q;
    }

    static getRandom(): HighloadQueryId {
        const shift = getRandomInt(0, Number(MAX_SHIFT));
        const bitnumber = getRandomInt(0, Number(MAX_BIT_NUMBER));
        return HighloadQueryId.fromShiftAndBitNumber(
            BigInt(shift),
            BigInt(bitnumber),
        );
    }

    getNext() {
        let newBitnumber = this.bitnumber + 1n;
        let newShift = this.shift;

        if (newShift === MAX_SHIFT && newBitnumber > MAX_BIT_NUMBER - 1n) {
            throw new Error("Overload"); // NOTE: we left one queryId for emergency withdraw
        }

        if (newBitnumber > MAX_BIT_NUMBER) {
            newBitnumber = 0n;
            newShift += 1n;
            if (newShift > MAX_SHIFT) {
                throw new Error("Overload");
            }
        }

        return HighloadQueryId.fromShiftAndBitNumber(newShift, newBitnumber);
    }

    hasNext() {
        const isEnd =
            this.bitnumber >= MAX_BIT_NUMBER - 1n && this.shift === MAX_SHIFT; // NOTE: we left one queryId for emergency withdraw;
        return !isEnd;
    }

    getShift(): bigint {
        return this.shift;
    }

    getBitNumber(): bigint {
        return this.bitnumber;
    }

    getQueryId(): bigint {
        return (this.shift << BIT_NUMBER_SIZE) + this.bitnumber;
    }

    static fromQueryId(queryId: bigint): HighloadQueryId {
        const shift = queryId >> BIT_NUMBER_SIZE;
        const bitnumber = queryId & 1023n;
        return this.fromShiftAndBitNumber(shift, bitnumber);
    }

    static fromSeqno(i: bigint): HighloadQueryId {
        const shift = i / 1023n;
        const bitnumber = i % 1023n;
        return this.fromShiftAndBitNumber(shift, bitnumber);
    }

    /**
     * @return {bigint} [0 .. 8380415]
     */
    toSeqno(): bigint {
        return this.bitnumber + this.shift * 1023n;
    }
}
