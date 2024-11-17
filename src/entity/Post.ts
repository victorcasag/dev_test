import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { User } from './User';

@Entity()
export class Post {
    @PrimaryGeneratedColumn()
    id!: number;
    @Column({ length: 100, nullable:false })
    title!: string;
    @Column({ length: 100, nullable:false })
    description!: string;
    @ManyToOne(() => User, user => user.posts)
    user!: User;
}
