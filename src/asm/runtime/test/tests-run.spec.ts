import {
    ADD,
    compileCell,
    DICTIGETJMPZ,
    DROP,
    IFBITJMPREF,
    Instr,
    MUL,
    DICTPUSHCONST,
    PUSHINT,
    PUSHINT_16,
    PUSHINT_8,
    SETCP,
    THROWARG,
    PUSHINT_LONG,
    NEWC,
    STREFCONST,
    ENDC,
    decompileCell,
    STREF2CONST,
    SUB,
} from "@/asm/runtime/index";
import {
    Address,
    beginCell,
    Cell,
    Contract,
    contractAddress,
    ContractProvider,
    Sender,
    StateInit,
    toNano,
    TupleBuilder,
    TupleReader,
} from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Maybe } from "@ton/core/dist/utils/maybe";
import * as i from "@/asm/runtime/index";
import * as u from "@/asm/runtime/util";
import { execute } from "@/asm/helpers/helpers";
import { code, dictMap } from "@/asm/runtime/util";
import { print } from "@/asm/text/printer";

const emptyData = () => beginCell().endCell();

const someFunction = (): Instr[] => [MUL(), ADD()];

const test = (
    methodId: number,
    instructions: Instr[],
    prepareData: () => Maybe<Cell>,
    compareResult: (res: TupleReader) => void,
): (() => Promise<void>) => {
    return async () => {
        const blockchain: Blockchain = await Blockchain.create();
        const treasury: SandboxContract<TreasuryContract> =
            await blockchain.treasury("treasury");

        const init: StateInit = {
            code: compileCell(instructions),
            data: prepareData(),
        };

        const address = contractAddress(0, init);
        const contract = new TestContract(address, init);

        const openContract = blockchain.openContract(contract);

        // Deploy
        await openContract.send(
            treasury.getSender(),
            {
                value: toNano("10"),
            },
            new Cell(),
        );

        const data = await openContract.getAny(methodId);
        compareResult(data);
    };
};

describe("instructions-execute", () => {
    it(
        "execute IFBITJMPREF true",
        test(
            0,
            [
                SETCP(0),
                DICTPUSHCONST(
                    19,
                    dictMap(
                        new Map([
                            // prettier-ignore
                            [0, [
                            PUSHINT_16(999),
                            PUSHINT_8(0b0100),
                            IFBITJMPREF(2, u.code([
                                DROP(),
                                DROP(),
                                PUSHINT(1),
                            ])),
                        ]],
                        ]),
                    ),
                ),
                DICTIGETJMPZ(),
                THROWARG(11),
            ],
            emptyData,
            (res: TupleReader) => {
                const num = res.readBigNumber();
                expect(Number(num)).toEqual(1);
            },
        ),
    );

    it(
        "execute IFBITJMPREF false",
        test(
            0,
            [
                SETCP(0),
                DICTPUSHCONST(
                    19,
                    dictMap(
                        new Map([
                            // prettier-ignore
                            [0, [
                            PUSHINT_16(999),
                            PUSHINT_8(0b0100),
                            IFBITJMPREF(10, u.code([
                                DROP(),
                                DROP(),
                                PUSHINT(1),
                            ])),
                        ]],
                        ]),
                    ),
                ),
                DICTIGETJMPZ(),
                THROWARG(11),
            ],
            emptyData,
            (res: TupleReader) => {
                const num = res.readBigNumber();
                expect(Number(num)).toEqual(999);
            },
        ),
    );

    it(
        "execute function via helper",
        test(
            0,
            [
                SETCP(0),
                DICTPUSHCONST(
                    19,
                    dictMap(
                        new Map([
                            // prettier-ignore
                            [0, [
                            ...execute(someFunction, PUSHINT(1), PUSHINT(2), PUSHINT(3)),
                        ]],
                        ]),
                    ),
                ),
                DICTIGETJMPZ(),
                THROWARG(11),
            ],
            emptyData,
            (res: TupleReader) => {
                const num = res.readBigNumber();
                expect(Number(num)).toEqual(7);
            },
        ),
    );

    it(
        "execute simple counter",
        test(
            65536,
            [
                i.SETCP(0),
                i.DICTPUSHCONST(
                    19,
                    dictMap(
                        new Map([
                            [
                                0,
                                [
                                    i.POP(0),
                                    i.SWAP(),
                                    i.CTOS(),
                                    i.PUSHINT(2),
                                    i.SDSKIPFIRST(),
                                    i.LDI(1),
                                    i.LDI(1),
                                    i.LDMSGADDR(),
                                    i.PUSH(1),
                                    i.XCHG_1(3, 4),
                                    i.XCHG2(6, 6),
                                    i.TUPLE(4),
                                    i.SETGLOB(1),
                                    i.XCHG_0(2),
                                    i.SETGLOB(2),
                                    i.PUSHCTR(4),
                                    i.CTOS(),
                                    i.LDI(1),
                                    i.SWAP(),
                                    i.PUSHCONT_SHORT(
                                        u.code([
                                            i.LDU(32),
                                            i.LDU(32),
                                            i.ROTREV(),
                                            i.BLKDROP2(1, 2),
                                        ]),
                                    ),
                                    i.PUSHCONT_SHORT(
                                        u.code([
                                            i.PUSHINT_16(257),
                                            i.LDIX(),
                                            i.SWAP(),
                                            i.SWAP(),
                                            i.ENDS(),
                                            i.PUSHINT(0),
                                        ]),
                                    ),
                                    i.IFELSE(),
                                    i.XCHG_0(3),
                                    i.PUSHCONT_SHORT(u.code([i.BLKDROP(3)])),
                                    i.IFJMP(),
                                    i.PUSHINT(0),
                                    i.PUSH(2),
                                    i.SBITS(),
                                    i.PUSH(0),
                                    i.GTINT(31),
                                    i.PUSHCONT_SHORT(
                                        u.code([
                                            i.POP(1),
                                            i.XCHG_0(2),
                                            i.LDU(32),
                                            i.XCHG_0(3),
                                        ]),
                                    ),
                                    i.IF(),
                                    i.PUSH(1),
                                    i.PUSHINT_LONG(2335447074n),
                                    i.EQUAL(),
                                    i.PUSHCONT(
                                        u.code([
                                            i.DROP2(),
                                            i.SWAP(),
                                            i.LDU(64),
                                            i.LDU(32),
                                            i.ROTREV(),
                                            i.BLKDROP2(2, 1),
                                            i.XCHG_1(1, 2),
                                            i.ADD(),
                                            i.NEWC(),
                                            i.PUSHINT(-1),
                                            i.SWAP(),
                                            i.STI(1),
                                            i.ROTREV(),
                                            i.XCHG_0(2),
                                            i.STU(32),
                                            i.STU(32),
                                            i.ENDC(),
                                            i.POPCTR(4),
                                        ]),
                                    ),
                                    i.IFJMP(),
                                    i.POP(3),
                                    i.EQINT(0),
                                    i.XCHG_0(2),
                                    i.LESSINT(33),
                                    i.XCHG_1(1, 2),
                                    i.AND(),
                                    i.IFJMPREF(
                                        u.code([
                                            i.SWAP(),
                                            i.NEWC(),
                                            i.PUSHINT(-1),
                                            i.SWAP(),
                                            i.STI(1),
                                            i.ROTREV(),
                                            i.XCHG_0(2),
                                            i.STU(32),
                                            i.STU(32),
                                            i.ENDC(),
                                            i.POPCTR(4),
                                        ]),
                                    ),
                                    i.DROP2(),
                                    i.THROW(130),
                                ],
                            ],
                            [
                                65536,
                                [
                                    i.PUSHCTR(4),
                                    i.CTOS(),
                                    i.LDI(1),
                                    i.SWAP(),
                                    i.PUSHCONT_SHORT(
                                        u.code([
                                            i.LDU(32),
                                            i.LDU(32),
                                            i.ROTREV(),
                                            i.BLKDROP2(1, 2),
                                        ]),
                                    ),
                                    i.PUSHCONT_SHORT(
                                        u.code([
                                            i.PUSHINT_16(257),
                                            i.LDIX(),
                                            i.SWAP(),
                                            i.SWAP(),
                                            i.ENDS(),
                                            i.PUSHINT(0),
                                        ]),
                                    ),
                                    i.IFELSE(),
                                    i.CALLREF(u.code([i.PUSH(0)])),
                                    i.BLKDROP2(2, 1),
                                ],
                            ],
                            [
                                105872,
                                [
                                    i.PUSHCTR(4),
                                    i.CTOS(),
                                    i.LDI(1),
                                    i.SWAP(),
                                    i.PUSHCONT_SHORT(
                                        u.code([
                                            i.LDU(32),
                                            i.LDU(32),
                                            i.ROTREV(),
                                            i.BLKDROP2(1, 2),
                                        ]),
                                    ),
                                    i.PUSHCONT_SHORT(
                                        u.code([
                                            i.PUSHINT_16(257),
                                            i.LDIX(),
                                            i.SWAP(),
                                            i.SWAP(),
                                            i.ENDS(),
                                            i.PUSHINT(0),
                                        ]),
                                    ),
                                    i.IFELSE(),
                                    i.CALLREF(u.code([i.PUSH(1)])),
                                    i.BLKDROP2(2, 1),
                                ],
                            ],
                        ]),
                    ),
                ),
                i.DICTIGETJMPZ(),
                i.THROWARG(11),
            ],
            () =>
                beginCell()
                    .storeUint(1, 1)
                    .storeInt(123, 32)
                    .storeInt(456, 32)
                    .endCell(),
            (res: TupleReader) => {
                const num = res.readBigNumber();
                expect(Number(num)).toEqual(456);
            },
        ),
    );

    it(
        "execute PUSHINT_LONG 130",
        test(
            0,
            [
                SETCP(0),
                DICTPUSHCONST(
                    19,
                    dictMap(
                        new Map([
                            // prettier-ignore
                            [0, [
                            PUSHINT_LONG(130n),
                        ]],
                        ]),
                    ),
                ),
                DICTIGETJMPZ(),
                THROWARG(11),
            ],
            emptyData,
            (res: TupleReader) => {
                const num = res.readBigNumber();
                expect(Number(num)).toEqual(130);
            },
        ),
    );

    it(
        "execute STREFCONST",
        test(
            0,
            [
                SETCP(0),
                DROP(),
                NEWC(),
                STREFCONST(code([PUSHINT(5), PUSHINT(6), ADD()])),
                ENDC(),
            ],
            emptyData,
            (res: TupleReader) => {
                const cell = res.readCell();
                expect(cell.refs.length).toEqual(1);
                const ref = cell.asSlice().loadRef();
                const decompiled = decompileCell(ref);
                expect(print(decompiled)).toEqual(
                    `PUSHINT 5\nPUSHINT 6\nADD\n`,
                );
            },
        ),
    );

    it(
        "execute STREF2CONST",
        test(
            0,
            [
                SETCP(0),
                DROP(),
                NEWC(),
                STREF2CONST(
                    code([PUSHINT(5), PUSHINT(6), ADD()]),
                    code([PUSHINT(6), PUSHINT(7), SUB()]),
                ),
                ENDC(),
            ],
            emptyData,
            (res: TupleReader) => {
                const cell = res.readCell();
                expect(cell.refs.length).toEqual(2);
                const slice = cell.asSlice();

                const ref = slice.loadRef();
                const decompiled = decompileCell(ref);
                expect(print(decompiled)).toEqual(
                    `PUSHINT 5\nPUSHINT 6\nADD\n`,
                );

                const ref2 = slice.loadRef();
                const decompiled2 = decompileCell(ref2);
                expect(print(decompiled2)).toEqual(
                    `PUSHINT 6\nPUSHINT 7\nSUB\n`,
                );
            },
        ),
    );
});

export class TestContract implements Contract {
    public readonly address: Address;
    public readonly init?: StateInit;

    public constructor(address: Address, init?: StateInit) {
        this.address = address;
        this.init = init;
    }

    public async send(
        provider: ContractProvider,
        via: Sender,
        args: { value: bigint; bounce?: boolean | null | undefined },
        body: Cell,
    ) {
        await provider.internal(via, { ...args, body: body });
    }

    public async getAny(
        provider: ContractProvider,
        id: number,
    ): Promise<TupleReader> {
        const builder = new TupleBuilder();
        const result = await provider.get(id, builder.build());
        return result.stack;
    }
}
